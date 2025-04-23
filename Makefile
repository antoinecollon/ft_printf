# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: acollon <acollon@student.s19.be>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/13 14:39:44 by acollon           #+#    #+#              #
#    Updated: 2025/04/13 14:56:07 by acollon          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRC_DIR = src
SRC		=	$(SRC_DIR)/ft_printf.c \
			$(SRC_DIR)/ft_putchar.c \
			$(SRC_DIR)/ft_putstr.c \
			$(SRC_DIR)/ft_putnbr.c \
			$(SRC_DIR)/ft_putnbr_unsigned.c \
			$(SRC_DIR)/ft_puthex.c \
			$(SRC_DIR)/ft_putptr.c \
			$(SRC_DIR)/ft_dispatch.c

OBJ = $(SRC:.c=.o)
CC = gcc
CFLAGS = -Wall -Wextra -Werror
RM = rm -f

# === Partie test ===
TEST_SRC = test/main.c
TEST_EXE = test_printf
# ===================

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $@ $^

%.o: %.c ft_printf.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)
	$(RM) $(TEST_EXE) # à commenter si besoin

re: fclean all

test: $(NAME)
	$(CC) $(CFLAGS) $(TEST_SRC) $(NAME) -o $(TEST_EXE)

.PHONY: clean re fclean all test

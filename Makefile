#* ************************************************************************** *#
#*                                                                            *#
#*                                                        :::      ::::::::   *#
#*   Makefile                                           :+:      :+:    :+:   *#
#*                                                    +:+ +:+         +:+     *#
#*   By: rmanfred <rmanfred@21-school.ru>           +#+  +:+       +#+        *#
#*                                                +#+#+#+#+#+   +#+           *#
#*   Created: 2020/10/26 23:45:50 by rmanfred          #+#    #+#             *#
#*   Updated: 2020/10/28 17:15:02 by rmanfred         ###   ########.fr       *#
#*                                                                            *#
#* ************************************************************************** *#

NAME = libasm.a
SRCS = srcs/ft_write.s \
	   srcs/ft_strlen.s \
	   srcs/ft_strcpy.s \
	   srcs/ft_read.s \
	   srcs/ft_strcmp.s \
	   srcs/ft_strdup.s

OBJ = $(SRCS:.s=.o)

CC = nasm 
CFLAGS = -fmacho64

%.o: %.s
	$(CC) $(CFLAGS) $< -o $@

all: $(NAME)

$(NAME): $(OBJ)
		ar rc $(NAME) $^

test: $(NAME)
	gcc -g -Wall -Wextra -Werror -L. -lasm main.c

clean:
	/bin/rm -f $(OBJ)

fclean: clean
	/bin/rm -f $(NAME)
	/bin/rm -f a.out

re: fclean all

.PHONY: all clean fclean re
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adenis <adenis@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/24 16:01:35 by adenis            #+#    #+#              #
#    Updated: 2017/03/29 20:43:19 by adenis           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC				=	gcc
NAME			=	lem-in
FLAGS			=	-Wall -Wextra -Werror

SRC				=	main.c ./srcs/parsing_1.c ./srcs/handle_rooms.c \
					./srcs/tools.c ./srcs/checks_1.c ./srcs/checks_2.c \
					./srcs/get_1.c ./srcs/get_path.c ./srcs/resolution.c

LIB				=	./libft/libft.a

HEADER 			=	lem-in.h
LIB_PATH		=	./libft

OBJS			=	$(SRC:%.c=%.o)

all : $(NAME)

$(NAME) : $(OBJS) $(LIB)
	@$(CC) $(FLAGS) $(SRC) $(LIB) -o $(NAME)

$(LIB):
	@make -C $(LIB_PATH)

%.o: %.c
	@$(CC) $(FLAGS)  -o $@ -c $<

clean :
	@rm -f $(OBJS)
	@make clean -C ./libft

fclean : clean
	@rm -f $(NAME)
	@make fclean -C ./libft

re : fclean all

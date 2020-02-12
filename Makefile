##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## Makefile for malloc project
##

MAINF	=	./src/

SRC		=	$(MAINF)strlen.asm				\
			$(MAINF)strchr.asm				\
			$(MAINF)memset.asm				\

OBJ	=	$(SRC:.c=.o)

LIBFL	=	-shared -fPIC

NAME	=	libasm.so

all:	$(NAME)

$(NAME):	$(OBJ)
	gcc -o $(NAME) $(LIBFL) $(OBJ)

clean:
	rm -f *.c~

fclean:	clean
	rm -f $(NAME)
	rm -f $(TESTNAME)
	rm -f $(OBJ)
	rm -f *.gcno
	rm -f *.gcda
	rm -f *.o

re:	fclean all

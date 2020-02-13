##
## EPITECH PROJECT, 2020
## Makefile
## File description:
## Makefile for minlibc
##

ASM	=	nasm

CC	=	gcc

RM	=	rm -f

SRCFOLDER	=	./src/

ASFLAGS	=	-f elf64

NAME	=	libasm.so

T_NAME	=	unit_tests

SRCS	=	$(SRCFOLDER)strlen.asm		\
			$(SRCFOLDER)strchr.asm		\
			$(SRCFOLDER)memset.asm		\
			$(SRCFOLDER)memcpy.asm		\
			$(SRCFOLDER)strcmp.asm		\

T_SRCS	=	tests/test_assembly.c

OBJS	=	$(SRCS:.asm=.o)

T_OBJS	=	$(T_SRCS:.c=.o)

all:		$(NAME)

$(NAME):	$(OBJS)
		$(CC) -shared -fPIC $(OBJS) -o $(NAME)

tests_run:	$(T_OBJS)
		$(CC) $(T_OBJS) -o $(T_NAME) -lcriterion -lgcov
		./$(T_NAME)

%.o : %.asm
		$(ASM) $(ASFLAGS) -o $@ $<

clean:
		$(RM) $(OBJS) $(T_OBJS)

fclean:		clean
		$(RM) $(NAME) $(T_NAME)

re:		fclean all

.PHONY:		all clean fclean re
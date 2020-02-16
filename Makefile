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

SRCS	=	$(SRCFOLDER)strlen.asm		\
			$(SRCFOLDER)strchr.asm		\
			$(SRCFOLDER)memset.asm		\
			$(SRCFOLDER)memcpy.asm		\
			$(SRCFOLDER)strcmp.asm		\
			$(SRCFOLDER)strncmp.asm		\
			$(SRCFOLDER)rindex.asm		\
			$(SRCFOLDER)strcasecmp.asm	\
			$(SRCFOLDER)strpbrk.asm		\
			$(SRCFOLDER)strstr.asm		\
			$(SRCFOLDER)strcspn.asm		\
			$(SRCFOLDER)memmove.asm		\

OBJS	=	$(SRCS:.asm=.o)

all:		$(NAME)

$(NAME):	$(OBJS)
		$(CC) -shared -fPIC $(OBJS) -o $(NAME)
	
%.o : %.asm
		$(ASM) $(ASFLAGS) -o $@ $<

clean:
		$(RM) $(OBJS)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHONY:		all clean fclean re
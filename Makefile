TARGET = wsprd

OBJECTS = \
  wsprd.o wsprd_utils.o wsprsim_utils.o tab.o fano.o jelinek.o nhash.o \
  indexx.o osdwspr.o pffft.o

CC = gcc
FC = gfortran
LD = gfortran
RM = rm -f

CFLAGS = -Wall -O3 -funroll-loops -march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard -ffast-math -fsingle-precision-constant -mvectorize-with-neon-quad
FFLAGS = -Wall -O3 -funroll-loops -march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard -ffast-math -fsingle-precision-constant -mvectorize-with-neon-quad

all: $(TARGET)

%.o: %.c
	${CC} -c ${CFLAGS} $< -o $@
%.o: %.f90
	${FC} -c ${FFLAGS} $< -o $@

$(TARGET): $(OBJECTS)
	$(LD) $(OBJECTS) -o $@

clean:
	$(RM) *.o $(TARGET)

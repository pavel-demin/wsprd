TARGET = wsprd

OBJECTS = \
  wsprd.o wsprd_utils.o wsprsim_utils.o tab.o fano.o jelinek.o nhash.o

CC = gcc
LD = gcc
RM = rm -f

CFLAGS = -Wall -O3 -funroll-loops -march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=hard -ffast-math -fsingle-precision-constant -mvectorize-with-neon-quad
LDFLAGS = -lm -lfftw3f

all: $(TARGET)

%.o: %.c
	${CC} -c ${CFLAGS} $< -o $@

$(TARGET): $(OBJECTS)
	$(LD) $(OBJECTS) $(LDFLAGS) -o $@

clean:
	$(RM) *.o $(TARGET)

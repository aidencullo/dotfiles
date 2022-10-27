target	:= output
objs	:= main.o solution.o

CC	:= gcc
CPP	:= g++ -std=c++17
CFLAGS	:= -Wall -Werror

all: $(target)

dep	:= $(pathsub %.o,%.d,$(objs))
-include $(deps)
DEPFLAGS = -MMD -MF $(@:.o=.d)

output: $(objs)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.cpp
	$(CPP) $(CFLAGS) -c $< $(DEPFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< $(DEPFLAGS)

clean:
	rm $(target) $(objs) *~ \#*\#

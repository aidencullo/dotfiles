target	:= output
objs	:= main.o file.o

CPP	:= g++ -std=c++17
CFLGAS	:= -Wall -Werror -Wformat

all: $(target)

dep	:= $(pathsub %.o,%.d,$(objs))
-include $(deps)
DEPFLAGS = -MMD -MF $(@:.o=.d)

output: $(objs)
	$(CPP) $(CFKAGS) -o $@ $^

%.o: %.cpp
	$(CPP) $(CFKAGS) -c $< $(DEPFLAGS)

clean:
	rm $(target) $(objs) *~ \#*\#

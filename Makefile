# source include directory
INCDIR=./include

# assembler, linker
AS=./tools/ca65
LD=./tools/ld65

# options to pass to the linker
LDOPTIONS= -m nspc.map
# linker configuration file
CFGFILE="nspc.cfg"
# output file
PRGROM=nspc.bin

# source file directory
SRC=./src

# object file directory
OBJ=./obj

OBJS = \
	$(OBJ)/kan.o \
	$(OBJ)/gft.o \
	$(OBJ)/sod.o \
	$(OBJ)/dir.o \


build:	$(OBJS)
	@echo linking...
	@$(LD) -C $(CFGFILE) $(LDOPTIONS) $(OBJS) -o $(PRGROM)

$(OBJ)/%.o:	$(SRC)/%.s
	@echo assembling $< ...
	@mkdir -p $(@D)
	@mkdir -p lst
	@$(AS) -I $(INCDIR) -o $@ -l ./lst/$(<F).lst $<

clean:
	rm -f $(OBJ)/*.o

cb: clean build

.PHONY: build clean cb

.SUFFIXES:

.SUFFIXES : .ftn .f .c .o .cdk

FFLAGS =

CFLAGS =

OPTIMIZ = -O 2

CPPFLAGS = 

PROGRAM = clonage

VER = 104

default: absolu

.ftn.o:
	s.compile -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<

.c.o:
	s.compile -abi $(ABI) $(OPTIMIZ) -opt "=$(CFLAGS)" -src $<

.f.o:
	s.compile -abi $(ABI) $(OPTIMIZ) -opt "=$(FFLAGS)" -src $<

OBJETS = clonage.o

Linux:
	r.remotemake -as_armnlib Linux $(PROGRAM) RELS=$(RELS)
	r.distribute -as_armnlib -rels_$(RELS) Linux $(PROGRAM)
SGI:
	r.remotemake -as_armnlib IRIX64 $(PROGRAM) RELS=$(RELS)
	r.distribute -as_armnlib -rels_$(RELS) IRIX64 $(PROGRAM)
	r.remotemake -as_armnlib IRIX $(PROGRAM) RELS=$(RELS)
	r.distribute -as_armnlib -rels_$(RELS) IRIX $(PROGRAM)
HP:
	r.remotemake -as_armnlib HP-UX $(PROGRAM) RELS=$(RELS)
	r.distribute -as_armnlib -rels_$(RELS) HP-UX $(PROGRAM)
SX4:
	r.remotemake -as_armnlib SX4 $(PROGRAM) RELS=$(RELS)
	r.distribute -as_armnlib -rels_$(RELS) -newbin SX4 $(PROGRAM)
SX5:
	r.remotemake -as_armnlib SX5 $(PROGRAM) RELS=$(RELS)
	r.distribute -as_armnlib -rels_$(RELS) -newbin SX5 $(PROGRAM)

all:	Linux SGI HP SX4 SX5


absolu: $(OBJETS)
	s.compile -o $(PROGRAM)_$(VER)-$(BASE_ARCH) -obj $(OBJETS) -abi $(ABI) -conly
	rm $(OBJETS)

clean:
	rm $(PROGRAM)_$(VER)-$(BASE_ARCH) 


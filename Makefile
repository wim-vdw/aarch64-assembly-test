AS = aarch64-linux-gnu-as
LD = aarch64-linux-gnu-ld

ASFLAGS = -g
LDFLAGS =

SRC_DIR = ./src
BUILD_DIR = ./build
TARGET = $(BUILD_DIR)/hello

SOURCES = $(wildcard $(SRC_DIR)/*.s)
OBJECTS = $(patsubst $(SRC_DIR)/%.s,$(BUILD_DIR)/%.o,$(SOURCES))

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s | $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean

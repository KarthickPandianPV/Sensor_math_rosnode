# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/karthick/Sensor_math_rosnode_maincode/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/karthick/Sensor_math_rosnode_maincode/build

# Include any dependencies generated for this target.
include sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/compiler_depend.make

# Include the progress variables for this target.
include sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/progress.make

# Include the compile flags for this target's objects.
include sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/flags.make

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionAhrs.c.o: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/flags.make
sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionAhrs.c.o: /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionAhrs.c
sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionAhrs.c.o: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/karthick/Sensor_math_rosnode_maincode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionAhrs.c.o"
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionAhrs.c.o -MF CMakeFiles/Fusion.dir/FusionAhrs.c.o.d -o CMakeFiles/Fusion.dir/FusionAhrs.c.o -c /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionAhrs.c

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionAhrs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/Fusion.dir/FusionAhrs.c.i"
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionAhrs.c > CMakeFiles/Fusion.dir/FusionAhrs.c.i

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionAhrs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/Fusion.dir/FusionAhrs.c.s"
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionAhrs.c -o CMakeFiles/Fusion.dir/FusionAhrs.c.s

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionCompass.c.o: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/flags.make
sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionCompass.c.o: /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionCompass.c
sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionCompass.c.o: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/karthick/Sensor_math_rosnode_maincode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionCompass.c.o"
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionCompass.c.o -MF CMakeFiles/Fusion.dir/FusionCompass.c.o.d -o CMakeFiles/Fusion.dir/FusionCompass.c.o -c /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionCompass.c

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionCompass.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/Fusion.dir/FusionCompass.c.i"
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionCompass.c > CMakeFiles/Fusion.dir/FusionCompass.c.i

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionCompass.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/Fusion.dir/FusionCompass.c.s"
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionCompass.c -o CMakeFiles/Fusion.dir/FusionCompass.c.s

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionOffset.c.o: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/flags.make
sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionOffset.c.o: /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionOffset.c
sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionOffset.c.o: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/karthick/Sensor_math_rosnode_maincode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionOffset.c.o"
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionOffset.c.o -MF CMakeFiles/Fusion.dir/FusionOffset.c.o.d -o CMakeFiles/Fusion.dir/FusionOffset.c.o -c /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionOffset.c

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionOffset.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/Fusion.dir/FusionOffset.c.i"
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionOffset.c > CMakeFiles/Fusion.dir/FusionOffset.c.i

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionOffset.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/Fusion.dir/FusionOffset.c.s"
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion/FusionOffset.c -o CMakeFiles/Fusion.dir/FusionOffset.c.s

# Object files for target Fusion
Fusion_OBJECTS = \
"CMakeFiles/Fusion.dir/FusionAhrs.c.o" \
"CMakeFiles/Fusion.dir/FusionCompass.c.o" \
"CMakeFiles/Fusion.dir/FusionOffset.c.o"

# External object files for target Fusion
Fusion_EXTERNAL_OBJECTS =

/home/karthick/Sensor_math_rosnode_maincode/devel/lib/libFusion.so: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionAhrs.c.o
/home/karthick/Sensor_math_rosnode_maincode/devel/lib/libFusion.so: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionCompass.c.o
/home/karthick/Sensor_math_rosnode_maincode/devel/lib/libFusion.so: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/FusionOffset.c.o
/home/karthick/Sensor_math_rosnode_maincode/devel/lib/libFusion.so: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/build.make
/home/karthick/Sensor_math_rosnode_maincode/devel/lib/libFusion.so: sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/karthick/Sensor_math_rosnode_maincode/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C shared library /home/karthick/Sensor_math_rosnode_maincode/devel/lib/libFusion.so"
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Fusion.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/build: /home/karthick/Sensor_math_rosnode_maincode/devel/lib/libFusion.so
.PHONY : sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/build

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/clean:
	cd /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion && $(CMAKE_COMMAND) -P CMakeFiles/Fusion.dir/cmake_clean.cmake
.PHONY : sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/clean

sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/depend:
	cd /home/karthick/Sensor_math_rosnode_maincode/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/karthick/Sensor_math_rosnode_maincode/src /home/karthick/Sensor_math_rosnode_maincode/src/sensor_math/lib/Fusion /home/karthick/Sensor_math_rosnode_maincode/build /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion /home/karthick/Sensor_math_rosnode_maincode/build/sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : sensor_math/lib/Fusion/CMakeFiles/Fusion.dir/depend


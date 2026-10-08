.global _start

.extern print_message
.extern exit_program

.section .text

_start:
    bl print_message
    bl exit_program

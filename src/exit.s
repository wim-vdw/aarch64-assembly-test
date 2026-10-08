.global exit_program

.section .text

exit_program:
    // Syscall exit: exit(int status)
    mov x0, #0      // error_code = 0
    mov w8, #93     // Linux syscall 93 (exit)
    svc #0          // Call supervisor to make the call

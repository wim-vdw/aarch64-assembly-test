.global print_message

.section .data

msg:
    .ascii "Hello Wim!\n"
    .ascii "This is a program made in AArch64 assembly.\n"

.equ len, . - msg

.section .text

print_message:
    // Syscall write: write(int fd, const void *buf, size_t count)
    mov x0, #1      // fd = 1 (stdout)
    ldr x1, =msg    // buf = address of string
    ldr x2, =len    // count = length of string
    mov w8, #64     // Linux syscall 64 (write)
    svc #0          // Call supervisor to make the call
    ret

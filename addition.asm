.model small
.stack 100h
.data
    msg1 db 'Enter first digit: $'
    msg2 db 'Enter second digit: $'
    msg3 db 'Sum is: $'
.code 
main proc
    mov ax, @data
    mov ds, ax

   
    mov ah, 9
    lea dx, msg1
    int 21h

    mov ah, 1         
    int 21h
    mov bl, al       

   
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

     
    mov ah, 9
    lea dx, msg2
    int 21h

    mov ah, 1
    int 21h
    mov bh, al       

   
    add bl, bh      
    mov al, bl
    mov ah, 0
    aaa               

    mov bx, ax       
    
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

  
    mov ah, 9
    lea dx, msg3
    int 21h

   
    mov dl, bh
    cmp dl, 0
    je skip_tens
    add dl, 48
    mov ah, 2
    int 21h 
    
    
skip_tens:

   
    mov dl, bl
    add dl, 48
    mov ah, 2
    int 21h

exit:
    mov ah, 4ch
    int 21h
main endp
end main

.model small
.stack 100h
.data
    num1 db 'Enter the first nubmer: $'
    num2 db 'Enter the second number : $'
    msg db 'Multiplication = $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx, num1
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov bl,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,num2
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    
    mul bl 
    aam
    mov bx,ax   
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,2
    mov dl,bh
    add dl,48
    int 21h  
    
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    
    mov ah,4ch
    int 21h
    main endp
end main
    
    



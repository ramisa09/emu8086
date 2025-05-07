.model small
.stack 100h
.data
    msg db 'Enter the number of multiplication table : $'
    n db ?
    a db ?
    b db ?
.code
main proc
    mov ax,@data
    mov ds,ax   
    
    mov ch,10
    mov cl,0
    
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov n,al
    
    mov a,al
    add a,48     
    
    mov b,0
    add b,48
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mul_table:
        
        mov al,cl
        mul n
        aam
        mov bx,ax
        
        mov ah,2
        mov dl,a
        int 21h
        mov dl,'*'
        int 21h
        mov dl,b
        int 21h
        mov dl,'='
        int 21h
        
        mov dl,bh
        add dl,48
        int 21h
        
        mov dl,bl
        add dl,48
        int 21h
        
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        inc cl
        inc b
        dec ch
        jnz mul_table
        
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    
    
    
    





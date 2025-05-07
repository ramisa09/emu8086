.model small
.stack 100h
.data
    inputmsg db 'Enter your number or word (press enter to finish): $'
    outputmsg db 'Reversed number or word is : $'
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,inputmsg
    int 21h
    
    mov cx,0
    
    take_input:
        mov ah,1
        int 21h
        cmp al,13  
        je done_input
        
        sub al,48
        push ax
        inc cx
        jmp take_input  
        
    done_input:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,outputmsg
    int 21h
    
    print:
        pop ax
        add al,48
        mov dl,al
        mov ah,2
        int 21h 
        dec cx
        jnz print        
            
    mov ah,4ch
    int 21h
    main endp
end main
    





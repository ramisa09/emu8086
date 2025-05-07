.model small
.stack 100h
.data
    inputmsg db  'Enter the string or number : $'
    msg1 db 13,10,'The given string is palindrome $'
    msg2 db 13,10,'The given string is not palindrome $'
    str  db 50 dup(0)
.code   
main proc
    mov ax,@data
    mov ds, ax
    
    mov ah,9
    lea dx,inputmsg
    int 21h
           
    
    lea si, str
    
    take_input:
        mov ah,1
        int 21h
        cmp al,13
        je done_input
        mov [si],al
        inc si
        jmp take_input  
        
        
    done_input:
        mov al,'$'
        mov [si],al
        
        lea si, str
        lea di, str
         
    find_end:     
        cmp byte ptr [di],'$'
        je ready_to_compare
        inc di
        jmp find_end 
                       
    ready_to_compare:
        dec di 
    
    compare_loop:
        mov al,[si]
        cmp al,[di] 
        jne not_palindrome
        
        inc si
        dec di
        cmp si,di
        jbe compare_loop  ;Jump if Below or Equal
        lea dx, msg1
        jmp print_msg
        
    not_palindrome: 
        lea dx,msg2     
    
    print_msg: 
        mov ah,9
        int 21h
                                                      
    mov ah,4ch
    int 21h  
    main endp 
end main
    
    


.model small
.stack 100 h
.data 
    num1 db 'Enter first number : $' 
    num2 db 'Enter second number : $' 
    num3 db 'Enter third number : $' 
    msg db 'Largest number is : $'
.code
main proc  
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx, num1
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al  

    mov ah,2
    mov dl,10
    int 21h
    mov dl,13     
    int 21h 
    
    mov ah,9
    lea dx, num2
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al 

    mov ah,2
    mov dl,10
    int 21h
    mov dl,13     
    int 21h 
    
    mov ah,9
    lea dx, num3
    int 21h
    
    mov ah,1
    int 21h
    mov ch,al 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,msg
    int 21h   
    
    cmp bh,bl   ; bh = num1, bl=num2, ch=num3
    jl level1
    jge level2
    
    level1:
    cmp bl,ch
    jl print_num3
    jge print_num2
    
    level2:
    cmp bh,ch
    jl print_num3
    jge print_num1
    
    print_num1:
    mov ah,2
    mov dl,bh
    int 21h
    jmp exit
    
    print_num2:
    mov ah,2
    mov dl,bl
    int 21h
    jmp exit
    
    print_num3:
    mov ah,2
    mov dl,ch
    int 21h
    
    exit:  
    mov ah,4ch
    int 21h
    main endp
end main
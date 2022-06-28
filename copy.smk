rule copy_file:
    input:
        in_file = "input.tsv", 
    params:
    output:
         out_file = "input_copy_no_{id}.tsv" , # here you should use {<variable>} to introduce variables in your design
    shell:
        "cp {input.in_file} {output.out_file}"

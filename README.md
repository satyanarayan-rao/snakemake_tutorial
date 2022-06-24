# snakemake_tutorial
Basic and Advanced Level Snakemake Workflows

## How to write rules in Snakemake

Here is the syntax for writing rules. 
```
rule copy_file:
    input:
        in_file = "<input_file>", 
    params:
    output:
         out_file = "<output file>" , # here you should use {<variable>} to introduce variables in your design
    shell:
        <write your command here>
```

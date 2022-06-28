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

To run the snakemake, please run the following:

```
$ snakemake -np --snakefile copy.smk <output_file>
```

Please remove `-np` flag to run the command in real.


## Intermediate level Snakemake

Here is the experiment that we want to try: Given a set of integers from `1` to
`n`, we want to test what should be the least number of draws with replacement
so that the mean of draw converges to mean of the numbers from `1` to `n` i.e.,
(n+1)/2. 

Please write a snakemake pipeline to produce a figure like the following: 

![Alt text] ("plots/experiment_for_1000.png")

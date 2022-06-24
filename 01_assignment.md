# Creating multiple copies of an input file

The motivation behind this assignment is to get acquainted with syntax of snakemake rule.

You are given a file `input.tsv`. You have to make `n` copies of this file.
Each copy should have a name of this format: `input_copy_no_<id>.tsv` where
`id` is the copy number. For example, output filename for id = 1 will be `input_copy_no_1.tsv`

## The shell script way

You can use `copy.sh` to do the same. But the goal here is to learn to write in Snakemake, so please get motivation from here and write that in Snakemake. 

```
sh copy.sh input.tsv 10
```

The above command will generate 10 copies.

# Splitting input file based on pattern

I have created list of projects and other lab management things in `to_do.tsv`. Now, you want to everyone's task in separate files. The output should be in the format `to_do_<name>.tsv`.
Please write a rule in sankemake to do this.

For example, you can find AZ's projects using the command: `awk '$2=="AZ"' to_do.tsv > to_do_AZ.tsv`

PS: please write to me if you issues installing Anaconda and Snakemake

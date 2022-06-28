rule draw:
    input:
    params:
    output: 
        draw = "sampling/draw_in_limit_{upper}_choose_{k}_times_{n}.tsv"
    shell:
        "python scripts/gen_sample_numbers.py {wildcards.upper} {wildcards.k} {wildcards.n} > {output.draw}"

def collect_files(wildcards):
    flist = [] 
    s_upper = config["testing_params"][wildcards.setting]["upper"]
    s_n = config["testing_params"][wildcards.setting]["n"]
    all_k = config["testing_params"][wildcards.setting]["k"]
    for s_k in all_k:
        fname = "sampling/draw_in_limit_{upper}_choose_{k}_times_{n}.tsv".format(upper = s_upper, k = s_k, n = s_n)
        flist.append(fname)
    return flist

rule combine:
    input:
        list_of_files = lambda wildcards: collect_files(wildcards) 
    params:
    output:
        combined = "combined/experiment_{setting}.tsv"
    shell:
        "cat {input.list_of_files} > {output.combined}"

rule boxplot_means:
    input:
        combined = "combined/experiment_{setting}.tsv"
    params:
        title = lambda wildcards: "Testing Draws for " + str(config["testing_params"][wildcards.setting]["upper"])
    output:
        mean_boxplot = "plots/experiment_{setting}.pdf"
    shell: 
        "cat {input.combined} | awk '{{print $1\"\t\"$3}}' | Rscript scripts/c2box.R {output.mean_boxplot} \"Mean\" \"{params.title}\""

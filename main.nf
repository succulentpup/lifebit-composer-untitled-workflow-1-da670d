nextflow.enable.dsl=2

include { abacas_1 } from './modules/abacas_1/module.nf'

workflow {
input1 = Channel.fromPath(params.abacas_1.meta_scaffold).splitCsv(sep: ';').map { row -> tuple(evaluate(row[0]), row[1]) }
input2 = Channel.fromPath(params.abacas_1.fasta)
abacas_1(input1, input2)
}

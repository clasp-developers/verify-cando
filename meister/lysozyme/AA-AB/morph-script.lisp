(COMMON-LISP:LOAD "source-dir:extensions;cando;src;lisp;start-cando.lisp")
(QUICKLISP-CLIENT:QUICKLOAD :FEP)
(COMMON-LISP:IN-PACKAGE :CANDO-USER)
(COMMON-LISP:LET ((FEP::TOTAL 0.0))
  (COMMON-LISP:LOOP FEP::FOR
                    FEP::FILENAME
                    FEP::IN
                    (list "AA-AB/ligand/side-analysis.dat" "AA-AB/complex/side-analysis.dat" )
                    FEP::FOR
                    COMMON-LISP:PATHNAME
                    COMMON-LISP:=
                    (COMMON-LISP:PATHNAME FEP::FILENAME)
                    FEP::FOR
                    FEP::CONTENTS
                    COMMON-LISP:=
                    (COMMON-LISP:WITH-OPEN-FILE
                        (FEP::FIN COMMON-LISP:PATHNAME :DIRECTION :INPUT)
                      (COMMON-LISP:READ FEP::FIN))
                    FEP::FOR
                    FEP::DG
                    COMMON-LISP:=
                    (COMMON-LISP:CDR (COMMON-LISP:ASSOC :TOTAL FEP::CONTENTS))
                    COMMON-LISP:DO
                    (COMMON-LISP:INCF FEP::TOTAL FEP::DG))
  (COMMON-LISP:WITH-OPEN-FILE
      (FEP::FOUT "AA-AB/morph-analysis.dat" :DIRECTION :OUTPUT)
    (COMMON-LISP:FORMAT FEP::FOUT "(( :total . ~f ))~%" FEP::TOTAL)))
(CORE:EXIT 0)

(set-logic BV)

(define-fun hd14 ((x (_ BitVec 32)) (y (_ BitVec 32))) (_ BitVec 32)
    (bvadd (bvand x y) (bvlshr (bvxor x y) #x00000001)))
(synth-fun f ((x (_ BitVec 32)) (y (_ BitVec 32))) (_ BitVec 32)
    ((Start (_ BitVec 32)))
    ((Start (_ BitVec 32) ((bvlshr Start Start) (bvxor Start Start) (bvadd Start Start) (bvand Start Start) x y #x00000001))))

(declare-var x (_ BitVec 32))
(declare-var y (_ BitVec 32))
(constraint (= (hd14 x y) (f x y)))

(check-synth)


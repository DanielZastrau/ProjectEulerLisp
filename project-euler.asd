;;;; Package-inferred system: every file is its own package, and the package name
;;;; maps to the file path, e.g. project-euler/problems/p0024-lexicographic-permutations
;;;; lives in problems/p0024-lexicographic-permutations.lisp. Dependencies are read from
;;;; each file's defpackage (:use / :import-from), so new problems need no registration here.

(defsystem "project-euler"
    :description "Project Euler solutions in Common Lisp."
    :author "Daniel Zastrau"
    :class :package-inferred-system
    :depends-on ("project-euler/runner"))

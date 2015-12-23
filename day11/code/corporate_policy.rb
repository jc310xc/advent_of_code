s = ARGV.first.dup
r = Regexp.union [*?a..?z].each_cons(3).map(&:join)
s.succ! until s[r] && s !~ /[iol]/ && s.scan(/(.)\1/).size > 1
p s
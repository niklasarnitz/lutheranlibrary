\version "2.24.3"
% Scan 242, printed p. 217: Eine andere Weise der Präfation an Weihnachten.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

shortBar = { \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," }
\score {
  <<
    \new Staff {
      \new Voice = "chant" {
        \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature \slurUp
        bes'1 ( a'1 ) g'1 ( f'1 ) g'1 a'1 ( bes'1 c''1 ) bes'1 ( a'1 ) a'1 \shortBar g'1 ( a'1 bes'1 ) g'1 ( f'1 ) f'1 \bar "" \break
        f'1 ( g'1 bes'1 ) g'1 ( a'1 ) g'1 g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 a'1 \bar "" \break
        a'1 ( g'1 ) g'1 ( a'1 ) a'1 \bar "|" a'1 a'1 ( bes'1 c''1 ) a'1 a'1 a'1 a'1 \shortBar a'1 bes'1 g'1 f'1 \bar "" \break
        f'1 ( g'1 bes'1 ) a'1 g'1 ( a'1 ) g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 a'1 a'1 ( g'1 ) g'1 ( a'1 ) a'1 \bar "|" g'1 a'1 a'1 a'1 \shortBar a'1 a'1 a'1 ( bes'1 c''1 ) a'1 a'1 \bar "" \break
        a'1 a'1 a'1 g'1 ( f'1 ) f'1 ( g'1 ) bes'1 g'1 ( a'1 ) g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        a'1 ( g'1 ) g'1 ( a'1 ) a'1 \bar "|" g'1 a'1 a'1 a'1 ( c''1 ) a'1 \shortBar a'1 a'1 a'1 a'1 a'1 bes'1 \bar "" \break
        a'1 ( g'1 ) a'1 g'1 ( a'1 ) g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 a'1 ( g'1 ) g'1 ( a'1 ) a'1 \bar "" \break
        g'1 a'1 a'1 ( c''1 ) a'1 g'1 ( f'1 ) f'1 ( g'1 bes'1 ) g'1 ( a'1 ) g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        a'1 a'1 ( g'1 ) g'1 ( a'1 ) a'1 \bar "|" a'1 ( bes'1 c''1 ) bes'1 ( a'1 ) a'1 a'1 a'1 ( g'1 ) g'1 ( a'1 ) a'1 a'1 \bar "" \break
        a'1 a'1 a'1 ( bes'1 c''1 ) bes'1 ( a'1 ) a'1 a'1 bes'1 g'1 ( f'1 ) f'1 ( g'1 a'1 bes'1 ) g'1 ( a'1 ) g'1 \bar "|."
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      "Wahr" \skip 1 "haft" \skip 1 "wür :" "dig" \skip 1 \skip 1 "und" \skip 1 "recht," "bil" \skip 1 \skip 1 "lig" \skip 1 "und"
      "heil" \skip 1 \skip 1 "sam" \skip 1 "ist" "es," "daß" "wir" "dir" "ü :" "ber :" "all" "und" "al :" "le :" "zeit"
      "dank" \skip 1 "sa" \skip 1 "gen," "HErr," "hei" \skip 1 \skip 1 "li :" "ger" "Va :" "ter," "all :" "mäch :" "ti :" "ger,"
      "e" \skip 1 \skip 1 "wi :" "ger" \skip 1 "Gott." "Denn" "was" "von" "der" "Welt" "her" "ver :" "bor :" "gen" "war,"
      "ist" "heu :" "te" "er" \skip 1 "schie" \skip 1 "nen" "und" "ein" "neu" "Licht" "dei :" "ner" "Herr" \skip 1 \skip 1 "lich :" "keit"
      "hat" "un :" "sre" "Au" \skip 1 "gen" \skip 1 "er :" "leuch" \skip 1 "tet." "Sicht-" "bar" "im" "Flei :" "sche" "wir"
      "Gott" \skip 1 "schau" \skip 1 "en," "der" "uns" "zur" "Lie" \skip 1 "be" "der" "un :" "sicht :" "ba :" "ren" "Gü :"
      "ter" \skip 1 "er :" "we" \skip 1 "cket." "Dar-" "um" "mit" "al :" "len" "En :" "geln" "und" "Erz" \skip 1 "en" \skip 1 "geln,"
      "mit" "den" "Thro" \skip 1 "nen" "und" \skip 1 "Herr" \skip 1 \skip 1 "schaf" \skip 1 "ten" "und" "mit" "dem" "gan :" "zen" "himm :"
      "li :" "schen" \skip 1 "Hee" \skip 1 "re" "sin" \skip 1 \skip 1 "gen" \skip 1 "wir" "dei :" "ner" \skip 1 "Herr" \skip 1 "lich :" "keit"
      "ei :" "nen" "Lob" \skip 1 \skip 1 "ge" \skip 1 "sang" "und" "spre :" "chen" \skip 1 "ohn" \skip 1 \skip 1 \skip 1 "En" \skip 1 "de:"
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}

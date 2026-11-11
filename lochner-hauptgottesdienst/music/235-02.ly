\version "2.24.3"
% Scan 235, printed p. 210: Besondere Präfation am Christtage, Anfang.
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
        g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 a'1 g'1 a'1 a'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" a'1 a'1 a'1 a'1 a'1 a'1 \bar "" \break
        a'1 a'1 f'1 g'1 a'1 g'1 g'1 g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 \bar "" \break
        bes'1 bes'1 \shortBar bes'1 bes'1 a'1 g'1 a'1 a'1 \bar "|" g'1 a'1 a'1 a'1 a'1 a'1 bes'1 a'1 a'1 \bar "" \break
        a'1 a'1 a'1 a'1 g'1 f'1 g'1 a'1 g'1 \bar "|" g'1 bes'1 bes'1 bes'1 bes'1 a'1 g'1 \bar "" \break
        a'1 a'1 \bar "|" g'1 a'1 a'1 a'1 a'1 a'1 g'1 a'1 bes'1 a'1 g'1 f'1 g'1 a'1 g'1 \bar "" \break
        g'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 bes'1 g'1 bes'1 bes'1 bes'1 a'1
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      "Wahr-" "haft" "wür :" "dig" "und" "recht," "bil :" "lig" "und" "heil :" "sam" "ist" "es," "daß" "wir" "dir"
      "ü :" "ber :" "all" "und" "al :" "le :" "zeit" "dank :" "sa :" "gen," "HErr," "hei :" "li :" "ger" "Va :" "ter,"
      "all :" "mäch :" "ti :" "ger," "e :" "wi :" "ger" "Gott." "Denn" "was" "von" "der" "Welt" "her" "ver :" "bor :"
      "gen" "war," "ist" "heu :" "te" "er :" "schie :" "nen" "und" "ein" "neu" "Licht" "dei :" "ner" "Herr :" "lich :" "keit"
      "hat" "un :" "se :" "re" "Au :" "gen" "er :" "leuch :" "tet." "Sicht :" "bar" "im" "Flei :" "sche" "wir" "Gott"
      "schau :" "en," "der" "uns" "zur" "Lie :" "be" "der" "un :" "sicht :" "ba :" "ren" "Gü :" "ter" "er :" "we :" "cket."
      "Dar :" "um" "mit" "al :" "len" "En :" "geln" "und" "Erz :" "en :" "geln," "mit" "den" "Thro :" "nen" "und"
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}

\version "2.24.3"
% Scan 238, printed p. 213: Besondere Präfation am Himmelfahrtsfeste, Anfang.
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
        g'1 bes'1 bes'1 bes'1 bes'1 bes'1 \shortBar bes'1 a'1 g'1 a'1 a'1 a'1 a'1 \bar "|" g'1 bes'1 bes'1
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      "Wahr-" "haft" "wür :" "dig" "und" "recht," "bil :" "lig" "und" "heil :" "sam" "ist" "es," "daß" "wir" "dir,"
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}

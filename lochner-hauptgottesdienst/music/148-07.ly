\version "2.24.3"
% Scan 148, printed p. 123: Gloria for Aposteltage, Schwarzburg 1675.
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  top-margin = 0\mm bottom-margin = 0\mm
  left-margin = 0\mm right-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
#(set-global-staff-size 18)
\score {
  <<
    \new Staff {
      \new Voice = "chant" {
        \clef treble \key g \major \cadenzaOn \omit Staff.TimeSignature
        \slurUp
        \override Stem.stencil = ##f
        \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 1)
        g'1 a'1 c''1 c''\breve d''1 b'1 d''\breve( c''1 b'1) b'\breve
        \bar "||"
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      "Eh :" re sei Gott in der "Hö : : : : :" \skip 1 \skip 1 he!
    }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

\version "2.24.3"
% Scan 147, printed p. 122: Gloria dominicale, Nürnb. Agendb. 1639.
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
        d'1 e'1 g'1 g'\breve fis'1 g'1 a'\breve( g'1) fis'1 fis'\breve
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

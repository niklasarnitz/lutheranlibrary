\version "2.24.3"
% Magdeb. 1615 Gloria, scan 147.
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
      fis'1( a'1) a'1 c''1 c''\breve c''1( a'1) c''1 a'1( fis'1) f'!\breve
      \bar "||"
    }
  }
  \new Lyrics \lyricsto "chant" {
    \set ignoreMelismata = ##t
    "Eh : : :" \skip 1 re sei Gott in \skip 1 der "Hö : :" \skip 1 he!
  }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

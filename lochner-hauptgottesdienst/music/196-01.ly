\version "2.24.3"
\language "english"

#(set-global-staff-size 18)

\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm
  right-margin = 0\mm
  top-margin = 0\mm
  bottom-margin = 0\mm
  indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

\score {
  <<
    \new Staff \with { \omit TimeSignature } {
      \new Voice = "melody" {
        \clef treble
        \cadenzaOn
        \slurUp
        d'2( a'4 g'4 a'4 e'4) f'2 e'4( g'4)
      }
    }
    \new Lyrics \lyricsto "melody" {
      \set ignoreMelismata = ##t
      Wir \skip 1 \skip 1 \skip 1 \skip 1 glau: ben \skip 1
    }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}

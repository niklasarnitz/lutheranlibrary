\version "2.24.3"
\language "english"

#(set-global-staff-size 14)

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
    \new Voice = "chant" {
    \clef treble
    \cadenzaOn
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 1)
    \omit Stem
    f'1 g'1( a'1) \bar "|"
    a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 \bar "|"
    bf'1 a'1 g'1 a'1 \bar "||"
    \break
    a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 a'1 \bar "|"
    g'1 f'1 g'1( a'1) g'1 \bar "||"
    }
  }
  \new Lyrics \lyricsto "chant" {
    Wohl de -- nen, die oh -- ne __ \skip 1 \skip 1 \skip 1 \skip 1 Wan -- del le -- ben,
    die im Ge -- setz des __ \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 HErr -- ren wan __ deln.
  }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}

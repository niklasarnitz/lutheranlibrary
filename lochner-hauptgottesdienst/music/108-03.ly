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
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)
    f'2 g'2( a'2) \bar "|"
    a'2 a'4 a'4 a'4 a'4 a'4\fermata \bar "|"
    bf'2 g'2 e'4( g'2) e'4 a'2 \bar "||"
    }
  }
  \new Lyrics \lyricsto "chant" {
    Eh -- re __ sei dem Va -- ter __ \skip 1 und dem Soh -- ne, __ \skip 1
  }
  \new Lyrics \lyricsto "chant" {
    Wie es war im An -- fang: jetzt und __ im -- mer: dar. __ \skip 1 \skip 1
  }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}

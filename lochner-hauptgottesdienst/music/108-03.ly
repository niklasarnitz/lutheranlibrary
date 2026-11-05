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
    \new Voice = "chant" {
    \clef treble
    \cadenzaOn
    \override Score.SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 2)
    f'2 g'2( a'2) \bar "|"
    a'2 a'4 a'4 a'4 a'4 a'4\fermata \bar "|"
    bf'2 a'2 g'4( g'2) g'4 a'2 \bar "||"
    }
  }
  \new Lyrics \lyricsto "chant" {
    \set ignoreMelismata = ##t
    Eh -- re __ \skip 2 sei dem Va -- ter __ \skip 4 \skip 4 und dem Soh __ \skip 4 \skip 4 ne,
  }
  \new Lyrics \lyricsto "chant" {
    \set ignoreMelismata = ##t
    Wie es war im An -- fang: __ \skip 4 \skip 4 \skip 4 jetzt und im __ \skip 2 mer: dar.
  }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-3 }
  }
}

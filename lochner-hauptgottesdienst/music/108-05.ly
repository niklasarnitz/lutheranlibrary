\version "2.24.3"
\language "english"

% Scan 108, printed p. 83: second rhythmic example, both underlaid verses.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  <<
    \new Staff \with { \omit TimeSignature } {
      \new Voice = "chant" {
        \clef treble \cadenzaOn \slurUp
        a'4 a'4 a'4. a'8 a'4 a'4 \bar "|"
        g'4^\markup \small "(gedehnter.)" g'2 g'4 f'2 g'2( a'2) g'1 \bar "|."
      }
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      \set stanza = "1."
      Und dem __ \skip 4. \skip 8 \skip 4 \skip 4
      Hei -- li -- gen Gei __ \skip 2 \skip 2 "ste,"
    }
    \new Lyrics \lyricsto "chant" {
      \set ignoreMelismata = ##t
      \set stanza = "2."
      Und von E -- wig -- keit zu E -- wig -- "keit."
      A __ \skip 2 \skip 2 "men."
    }
  >>
  \layout {
    ragged-right = ##t
    \context { \Lyrics \override LyricText.font-size = #-1 }
  }
}

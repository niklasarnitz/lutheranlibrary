\version "2.24.3"
% Scan 160, printed p. 135: St. Louis Agenda formula in the footnote.
% Nine G4 whole notes, then A4–B4–C5–D5–D5; slur on A4–C5.
#(set-global-staff-size 18)
\paper {
  paper-width = 100\mm
  left-margin = 0\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  tagline = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  <<
    \new Staff <<
      \new Voice = "melody" {
        \clef treble \cadenzaOn \slurUp
        g'1 g' g' g' g' g' g' g' g'
        a'1( b' c'') d'' d'' \bar "|."
      }
    >>
    \new Lyrics \lyricsto "melody" {
      \set ignoreMelismata = ##t
      Dein Wort ist die Wahr -- heit. __
      \skip 1 \skip 1
      Hal -- le __ \skip 1 \skip 1 lu -- "ja!"
    }
    \new Lyrics \lyricsto "melody" {
      \set ignoreMelismata = ##t
      Das -- sel -- be ist un -- sers Her -- zens Freu -- de __
      \skip 1 \skip 1 und "Trost."
    }
    \new Lyrics \lyricsto "melody" {
      \set ignoreMelismata = ##t
      Er -- he -- ben __
      \repeat unfold 6 { \skip 1 }
      wir __ \skip 1 \skip 1 zum "HErrn."
    }
    \new Lyrics \lyricsto "melody" {
      \set ignoreMelismata = ##t
      Und mit dei -- nem __
      \repeat unfold 5 { \skip 1 }
      Gei -- \skip 1 \skip 1 \skip 1 "ste."
    }
    \new Lyrics \lyricsto "melody" {
      \set ignoreMelismata = ##t
      A -- \repeat unfold 12 { \skip 1 } "men."
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-1 }
  }
}

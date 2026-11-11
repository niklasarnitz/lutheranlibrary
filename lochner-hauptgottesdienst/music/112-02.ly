\version "2.24.3"
% Scan 112, printed p. 87: Dritter Ton, II. Chor.
#(set-global-staff-size 18)
\header { piece = "II. Chor." tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 4\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  <<
    \new Staff <<
      \key g \major \cadenzaOn
      \new Voice = "choir" {
        \voiceOne \slurUp
        <b g'>1 \bar "|" \break
        <c' e'>1 <c' e'>1 <e' g'>1 <dis' fis'>1(
        \once \override NoteColumn.force-hshift = #-0.6 e'1) \bar "|."
      }
      \new Voice {
        \voiceTwo s1 s1 s1 s1 s1
        \once \override NoteColumn.force-hshift = #0.6 e'1
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "1."
      "Daß" du mir hel -- "fest."
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "2."
      "Um deines Namens willen : wollest du mich" lei -- ten und füh -- "ren."
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "3."
      "Errette mich : durch" dei -- ne Ge -- rech -- "tigkeit."
    }
    \new PianoStaff <<
      \new Staff {
        \key g \major \cadenzaOn \slurUp
        <d' g'>1 \bar "|"
        <c' e'>1 <c' e'>1 <e' g'>1 <dis' fis'>1( <b e'>1) \bar "|."
      }
      \new Staff <<
        \clef bass \key g \major \cadenzaOn
        \new Voice { \voiceOne b1 g1 a1 b1 b1 g1 }
        \new Voice { \voiceTwo g1 c1 b,1 e,1 b,1( e1) }
      >>
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-1 }
  }
}

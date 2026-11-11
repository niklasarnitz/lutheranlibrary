\version "2.24.3"
% Scan 113, printed p. 88: Fünfter Ton, I. Chor.
#(set-global-staff-size 18)
\header { piece = "I. Chor." tagline = ##f }
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
      \new Voice = "choir" {
        \key f \major \cadenzaOn \voiceOne
        \once \override NoteColumn.force-hshift = #-0.6 f'1 <f' a'>1 <e' c''>1 \bar "|"
        <e' c''>1 <e' c''>1 \bar "|" \break
        <g' d''>1 <e' c''>1 \bar "|."
      }
      \new Voice {
        \voiceTwo
        \once \override NoteColumn.force-hshift = #0.6 f'1
        s1 s1 s1 s1 s1 s1
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "1."
      Uns ist ein Kind -- "ge :" "bo :" "ren,"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 3 { \skip 1 } \set stanza = "2."
      "Welches Herrschaft : ist auf" "seiner" "Schul :" "ter."
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 3 { \skip 1 } \set stanza = "3."
      "Singet dem HErrn" ein "neu :" "es Lied,"
    }
    \new PianoStaff <<
      \new Staff {
        \key f \major \cadenzaOn
        <c' f'>1 <f' a'>1 <e' c''>1 \bar "|"
        <e' c''>1 <e' c''>1 \bar "|"
        <g' d''>1 <e' c''>1 \bar "|."
      }
      \new Staff {
        \clef bass \key f \major \cadenzaOn
        <f a>1 <d f>1 <c g>1 \bar "|"
        <c g>1 <a, a>1 \bar "|"
        <g, b>1 <c g>1 \bar "|."
      }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-1 }
  }
}

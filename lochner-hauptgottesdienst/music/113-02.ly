\version "2.24.3"
% Scan 113, printed p. 88: Fünfter Ton, II. Chor.
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
      \new Voice = "choir" {
        \key f \major \cadenzaOn
        <f' c''>1 \bar "|" \break
        <bes' d''>1 <g' bes'>1 <e' c''>1 <f' a'>1 \bar "|."
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "1."
      "Ein Sohn ist" uns ge -- ge -- "ben,"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "2."
      "Und er heißt Wunderbar : Rath : Kraft : Held : Ewig-" va -- "ter," Frie -- "defürst."
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "3."
      "Denn" er thut Wun -- "der."
    }
    \new PianoStaff <<
      \new Staff {
        \key f \major \cadenzaOn
        <f' c''>1 \bar "|"
        <f' d''>1 <g' bes'>1 <g' c''>1 <f' a'>1 \bar "|."
      }
      \new Staff <<
        \clef bass \key f \major \cadenzaOn
        \new Voice { \voiceOne a1 \once \override NoteColumn.force-hshift = #-0.6 bes1 d'1 e'1 c'1 }
        \new Voice { \voiceTwo f1 \once \override NoteColumn.force-hshift = #0.6 bes1 g1 c1 f1 }
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

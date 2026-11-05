\version "2.24.3"
% Scan 114, printed p. 89: eighth tone, II. Chor, complete printed score.
% Handwritten parenthesized quarter notes are excluded from the printed score.
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
      \key bes \major \cadenzaOn
      \new Voice = "choir" {
        \voiceOne bes'1 \bar "|" \break
        a'1 bes'1 g'1
        \once \override NoteColumn.force-hshift = #-0.6 f'1 \bar "|."
      }
      \new Voice {
        \voiceTwo d'1 f'1 d'1 e'!1
        \once \override NoteColumn.force-hshift = #0.6 f'1
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "1."
      \markup \center-column { "Gedenket daran :" "wie er euch sagte :" }
      Hal -- le -- lu -- "ja!"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "2."
      \markup \center-column { "Und am dritten Tage auferstehen :" "Halleluja :" }
      Hal -- le -- lu -- "ja!"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "3."
      "Und hast ihn zum HErrn gemacht :" dei -- ner Hän -- "de Werk."
    }
    \new PianoStaff <<
      \new Staff {
        \key bes \major \cadenzaOn
        <f' bes'>1 \bar "|"
        <f' a'>1 <f' bes'>1 <e'! g'>1 <c' f'>1 \bar "|."
      }
      \new Staff <<
        \clef bass \key bes \major \cadenzaOn
        \new Voice { \voiceOne d'1 c'1 d'1 c'1 a1 }
        \new Voice { \voiceTwo bes1 f1 bes,1 c1 f1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context {
      \Lyrics \override LyricText.font-size = #-1
      \override VerticalAxisGroup.nonstaff-nonstaff-spacing.minimum-distance = #6
    }
  }
}

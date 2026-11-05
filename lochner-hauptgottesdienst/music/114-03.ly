\version "2.24.3"
% Scan 114, printed p. 89: eighth tone, Beide Chöre, complete.
% One choir recitation chord spans three separately printed organ harmonies.
#(set-global-staff-size 18)
\header { piece = "Beide Chöre." tagline = ##f }
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
        \voiceOne
        f'1 g'1 bes'1 \bar "|" \break
        bes'1 s1 s1 \bar "|" c''1 bes'1 \bar "||" \break
        bes'1 \bar "|" a'1 a'1 bes'1 g'1
        \once \override NoteColumn.force-hshift = #-0.6 f'1 \bar "|."
      }
      \new Voice {
        \voiceTwo d'1 ees'1 d'1 d'1 s1 s1 f'1 d'1
        d'1 f'1 f'1 d'1 e'!1
        \once \override NoteColumn.force-hshift = #0.6 f'1
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      Eh -- re "sei :" "dem Vater : und dem" Soh -- "ne :"
      "und dem" Hei -- li -- gen Gei -- "ste,"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 3 { \skip 1 }
      \markup \center-column { "wie es war im Anfang :" "jetzt und" }
      immer -- "dar :"
      \markup \center-column { "und von Ewigkeit" "zu" }
      E -- wig -- "keit." A -- "men."
    }
    \new PianoStaff <<
      \new Staff {
        \key bes \major \cadenzaOn
        <d' f'>1 <ees' g'>1 <f' bes'>1 \bar "|"
        <f' bes'>1 <f' bes'>1 <g' bes'>1 \bar "|"
        <a' c''>1 <f' bes'>1 \bar "||"
        <f' bes'>1 \bar "|" <f' a'>1 <f' a'>1 <f' bes'>1 <e'! g'>1 <c' f'>1 \bar "|."
      }
      \new Staff <<
        \clef bass \key bes \major \cadenzaOn
        \new Voice {
          \voiceOne bes1 bes1 d'1 d'1 d'1 d'1 f'1 d'1
          d'1 c'1 c'1 d'1 c'1 a1
        }
        \new Voice {
          \voiceTwo bes,1 ees1 d1 bes,1 bes1 g1 f1 bes,1
          bes1 f1 f1 bes,1 c1 f1
        }
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

\version "2.24.3"
% Scan 113, printed p. 88: fifth tone, Beide Chöre, complete.
% The choir has a single reciting chord where the organ changes harmony.
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
      \key f \major \cadenzaOn
      \new Voice = "choir" {
        \voiceOne
        \once \override NoteColumn.force-hshift = #-0.6 f'1
        a'1 c''1 \bar "|" \break
        c''1 s1 \bar "|" d''1 c''1 \bar "||" \break
        c''1 \bar "|" d''1 d''1 bes'1 c''1 a'1 \bar "|."
      }
      \new Voice {
        \voiceTwo
        \once \override NoteColumn.force-hshift = #0.6 f'1
        f'1 e'1 e'1 s1 g'1 e'1
        f'1 bes'1 bes'1 g'1 e'1 f'1
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      Eh -- re "sei :" "dem Vater und dem" Soh -- "ne :"
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
        \key f \major \cadenzaOn
        <c' f'>1 <f' a'>1 <e' c''>1 \bar "|"
        <e' c''>1 <e' c''>1 \bar "|" <g' d''>1 <e' c''>1 \bar "||"
        <f' c''>1 \bar "|" <f' d''>1 <f' d''>1 <g' bes'>1 <g' c''>1 <f' a'>1 \bar "|."
      }
      \new Staff <<
        \clef bass \key f \major \cadenzaOn \accidentalStyle forget
        \new Voice {
          \voiceOne a1 f1 g1 g1 a1 b!1 g1 a1
          \once \override NoteColumn.force-hshift = #-0.6 bes1
          \once \override NoteColumn.force-hshift = #-0.6 bes1
          d'1 e'1 c'1
        }
        \new Voice {
          \voiceTwo f1 d1 c1 c1 a,1 g,1 c1 f1
          \once \override NoteColumn.force-hshift = #0.6 bes1
          \once \override NoteColumn.force-hshift = #0.6 bes1
          g1 c1 f1
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

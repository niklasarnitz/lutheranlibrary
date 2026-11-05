\version "2.24.3"
% Scan 114, printed p. 89: eighth tone, I. Chor, complete printed score.
% The pale handwritten parentheses and black quarter-note additions are
% annotations to the copy, not part of the original typeset notation.
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
        \key bes \major \cadenzaOn
        <d' f'>1 <ees' g'>1 <d' bes'>1 \bar "|" \break
        <d' bes'>1 \bar "" \break
        <d' bes'>1 <g' bes'>1 \bar "|" <f' c''>1 <d' bes'>1 \bar "|."
      }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t \set stanza = "1."
      Er ist auf --
      \markup \center-column { "erstanden : was suchet ihr :" "den Lebendigen bei den Todten :" }
      Hal -- le -- lu -- "ja!"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 3 { \skip 1 } \set stanza = "2."
      "Des Menschen Sohn : muß ge-" kreu -- zigt wer -- "den,"
    }
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t
      \repeat unfold 3 { \skip 1 } \set stanza = "3."
      "Mit Ehre und Schmuck : hast du" ihn ge -- krö -- "net,"
    }
    \new PianoStaff <<
      \new Staff {
        \key bes \major \cadenzaOn
        <d' f'>1 <ees' g'>1 <f' bes'>1 \bar "|"
        <f' bes'>1 <f' bes'>1 <g' bes'>1 \bar "|"
        <a' c''>1 <f' bes'>1 \bar "|."
      }
      \new Staff <<
        \clef bass \key bes \major \cadenzaOn
        \new Voice { \voiceOne bes1 bes1 d'1 d'1 d'1 d'1 f'1 d'1 }
        \new Voice { \voiceTwo bes,1 ees1 d1 bes,1 bes1 g1 f1 bes,1 }
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

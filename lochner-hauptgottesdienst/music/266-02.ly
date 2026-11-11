\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 266, printed p. 241.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key c \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { f'1 f'1 e'1 f'1 a'1 g'1 f'1 e'\breve( f'\breve) g'\breve \bar "|" bes'1 a'1 a'1 s2 g'\breve f'\breve \bar "|" a'1 c''1 bes'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Ge -- hei -- li -- get wer -- de dein Na -- \skip 1 "me." Zu -- kom -- me dein "Reich." Dein Wil -- le }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 r1 r1 r1 r1 r1 e'\breve( <c' f'>\breve) <e' g'>\breve \bar "|" <d' f' bes'>1 <c' f' a'>1 r2 f'2 s2 << { <c' g'>\breve } \\ { s1 e'1 } >> <c' f'>\breve \bar "|" <c' f' a'>1 <c' g' c''>1 <d' f' bes'>1 }
      \new Staff { \clef bass \global r1 r1 r1 r1 r1 r1 r1 <g bes>\breve( <f a>\breve) <c c'>\breve \bar "|" bes,1 f1 r1 s2 c\breve <f, a>\breve \bar "|" f1 e1 d1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}

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
      \new Voice = "melody" { r1\fermata \bar "||" g'1 g'1 g'\breve g'\breve\fermata \bar "|" f'1 g'1 a'1 a'1 \bar "|" a'1 a'1 bes'\breve a'\breve s2 g'\breve f'\breve }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t Laßt uns be -- "ten!" Va -- ter un -- "ser," der du bist im Him -- "mel," }
    \new PianoStaff <<
      \new Staff { \clef treble \global <c' e' g'>1\fermata \bar "||" r1 r1 <c' e' g'>\breve <c' e' g'>\breve \bar "|" r1 r1 r1 <c' f' a'>1 \bar "|" r1 r1 <d' f' bes'>\breve <c' f' a'>\breve f'2 << { <c' g'>\breve } \\ { s1 e'1 } >> <c' f'>\breve }
      \new Staff { \clef bass \global c1 \bar "||" r1 r1 c\breve c\breve \bar "|" r1 r1 r1 f1 \bar "|" r1 r1 bes,\breve f\breve s2 c\breve <f a>\breve }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
